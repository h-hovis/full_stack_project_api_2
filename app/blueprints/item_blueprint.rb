# frozen_string_literal: true

class ItemBlueprint < Blueprinter::Base
    identifier :id

    view :normal do
        fields :name, :category, :price, :description, :image_url
    end
end
