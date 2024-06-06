module TasksHelper
    def tasks_filtered_by_status
        Task.statuses.keys
      end
end
