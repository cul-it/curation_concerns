require 'spec_helper'

RSpec.describe CurationConcerns::Workflow::ActivateObject do
  let(:work) { GenericWork.new }
  let(:user) { User.new }

  describe ".call" do
    subject do
      described_class.call(target: work,
                           comment: "A pleasant read",
                           user: user)
    end

    it "makes it active" do
      subject
      expect(work.state).to eq Vocab::FedoraResourceStatus.active
    end
  end
end
