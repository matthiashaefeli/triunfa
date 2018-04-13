module TablesHelper

    def find_tables(u1)
        if Table.find_by(user: u1)
            table = Table.find_by(user: u1)
        elsif Table.find_by(seconduser: u1)
            table = Table.find_by(seconduser: u1)
        else
            table = nil
        end
    end
end
