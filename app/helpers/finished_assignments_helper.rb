module FinishedAssignmentsHelper

    def finished_ass(user)
        return FinishedAssignment.where(user: user)
    end
end
