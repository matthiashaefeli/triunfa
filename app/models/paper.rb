class Paper < ApplicationRecord

    # has_attached_file :document
    # validates_attachment_file_name :document, matches: [/\.xls?$/, /\.xlsx?$/, /\.csv?$/, /\.pdf?$/]

    # has_attached_file :document,
    #                     :storage => :s3,
    #                     :s3_credentials => Proc.new{|a| a.instance.s3_credentials }
    # validates_attachment_file_name :document, matches: [/\.xls?$/, /\.xlsx?$/, /\.csv?$/, /\.pdf?$/]

    # def s3_credentials
    # {:bucket => "bibliotecasuperate", :access_key_id => "AKIAJ3ICLER5G3N7YHBA", :secret_access_key => "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"}
    # end

    has_attached_file :document,
                    :storage => :fog,
                    :fog_credentials => {
                    provider: "AWS",
                    aws_access_key_id: ENV["aws_key"],
                    aws_secret_access_key: ENV["aws_secret_key"]
                    },
                    :fog_directory => ENV["aws_library"]

    validates_attachment_file_name :document, matches: [/\.xls?$/, /\.xlsx?$/, /\.csv?$/, /\.pdf?$/, /\.png?$/, /\.jpg?$/]

    belongs_to :folder
end
