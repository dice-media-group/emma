class Lead
    include ActiveModel::Model

    attr_accessor   :name, :phone, :email_address, :subject, :message_body
    validates       :name, :phone, :email_address, presence: true


    def save
        if valid?
            # send email
            # send a text
            # send to hubspot api
            # possibly create a new record on local db
            # Lead.create(params)
            #LeadMailer.message(params).deliver_later

            puts "================================"
            puts "saving the message"
            puts "================================"
            true
        else
            false
        end
    end

    def join_mailing_list
    ActiveRecord::Type::Boolean.new.cast(@join_mailing_list)
    end
end
