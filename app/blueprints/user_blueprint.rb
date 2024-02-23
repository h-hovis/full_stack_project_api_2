# frozen_string_literal: true

class UserBlueprint < Blueprinter::Base
    identifier :id

    view :normal do
        fields :first_name, :last_name, :email, :username, :password_digest
    end
end
