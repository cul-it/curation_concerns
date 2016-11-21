module CurationConcerns
  module Workflow
    # This is a built in function for workflow, so that a workflow action can be created that
    # deactivates an object.
    # Target is an instance of a model with CurationConcerns::Suppressible
    # behavior included.
    class DeactivateObject
      def self.call(target:, **)
        target.deactivate
      end
    end
  end
end
