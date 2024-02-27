# frozen_string_literal: true

class ReviewBlueprint < Blueprinter::Base
    identifier :id

    association :user, blueprint: UserBlueprint, view: :normal
    association :item, blueprint: ItemBlueprint, view: :normal

    view :normal do
        fields :rating, :comment, :user_id, :item_id
    end
end
