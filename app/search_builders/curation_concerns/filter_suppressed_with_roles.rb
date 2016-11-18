module CurationConcerns
  module FilterSuppressedWithRoles
    extend CurationConcerns::FilterSuppressed

    def only_active_works(solr_parameters)
      if user_work_permissions.empty?
        super unless current_ability.current_user.admin?
      end
    end

    def current_work
      GenericWork.find(blacklight_params[:id])
    end

    def user_work_permissions
      permission_query.scope_permitted_workflow_actions_available_for_current_state(:user => current_ability.current_user, :entity => current_work.to_sipity_entity)
    end

    def permission_query
      CurationConcerns::Workflow::PermissionQuery
    end
  end
end
