class Paper < ApplicationRecord

    has_attached_file :document
    validates_attachment_file_name :document, matches: [/\.xls?$/, /\.xlsx?$/, /\.csv?$/, /\.pdf?$/]

    belongs_to :folder
end
