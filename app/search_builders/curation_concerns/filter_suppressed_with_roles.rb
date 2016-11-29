module CurationConcerns
  module FilterSuppressedWithRoles
    extend ActiveSupport::Concern

    include CurationConcerns::FilterSuppressed

    def only_active_works(solr_parameters)
      if current_work.respond_to?(:to_sipity_entity) # Used because Collections use WorkSearchBuilder to filter down to a single item
        super if user_work_permissions.empty?
      else
        super
      end
    end

    private

      def current_work
        ActiveFedora::Base.find(blacklight_params[:id])
      end

      def user_work_permissions
        permission_query.scope_permitted_workflow_actions_available_for_current_state(user: current_ability.current_user, entity: current_work.to_sipity_entity)
      end

      def permission_query
        CurationConcerns::Workflow::PermissionQuery
      end
  end
end
