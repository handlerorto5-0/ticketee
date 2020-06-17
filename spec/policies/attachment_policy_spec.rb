require 'rails_helper'

RSpec.describe AttachmentPolicy, type: :policy do
  context "permissions" do
    subject { AttachmentPolicy.new(author, attachment) }

    let(:author) {FactoryGirl.create(:user)}
    let(:project) {FactoryGirl.create(:project)}
    let(:ticket) {FactoryGirl.create(:ticket, project: project, author: author)}
    let(:attachment) {FactoryGirl.create(:attachment, ticket: ticket)}

    context "for anomymous users" do
      let(:user) {nil}
      it {should_not permit_action :show}
    end

    context "for viewers of the project" do
      before {assign_role!(author, :viewer, project)}
      it {should permit_action :show}
    end

    context "for editors of the project" do
      before {assign_role!(author, :editor, project)}
      it {should permit_action :show}
    end

    context "for managers of the project" do
      before {assign_role!(author, :manager, project)}
      it {should permit_action :show}
    end

    context "for managers of other projects" do
      before do
        assign_role!(author, :manager, FactoryGirl.create(:project))
      end
      it {should_not permit_action :show}
    end

    context "for administrators" do
      let(:author) {FactoryGirl.create :user, :admin}
      it {should permit_action :show}
    end

  end
end
