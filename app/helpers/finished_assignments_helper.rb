module FinishedAssignmentsHelper

    def finished_ass(user, group)
        group = Group.find(params[:group])
        return FinishedAssignment.where(user: user, group: group)
    end

    def user_groups_array
        groups = []
        for finishedassignment in FinishedAssignment.where(user: current_user)
            if groups.exclude?(finishedassignment.group.id)
                groups.push(finishedassignment.group.id)
            end
        end
        return groups
    end

    def points_per_course
        graduate = []
        for id in user_groups_array
            group = Group.find(id)
            finished_assignments = FinishedAssignment.where(user: current_user, group: group)
            points_array = 0
            for finished in finished_assignments
                points_array += finished.assignment.points
            end
            if points_array > 32
                graduate.push(group)
            end
        end
        return graduate
    end

end
