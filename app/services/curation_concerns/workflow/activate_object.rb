module CurationConcerns
  module Workflow
    # This is a built in function for workflow, so that a workflow action can be created that
    # activates an object.
    # Target is an instance of a model with CurationConcerns::Suppressible
    # behavior included.
    class ActivateObject
      def self.call(target:, **)
        target.activate
      end
    end
  end
end
