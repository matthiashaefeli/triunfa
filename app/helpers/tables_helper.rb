module TablesHelper

    def find_table(u1, u2)
        if Table.find_by(user: u1, seconduser: u2)
            table = Table.find_by(user: u1, seconduser: u2)
        elsif Table.find_by(user: u2, seconduser: u1)
            table = Table.find_by(user: u2, seconduser: u1)
        else
            table = nil
        end
    end
end
