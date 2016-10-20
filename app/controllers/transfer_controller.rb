class TransferController < ApplicationController

  def search_kor_menu_name
    @food_glossary_kor = Hash.new

    Foodglossary.first(100).sample(30).each do |f|
      @food_glossary_kor["results"] = Array.new
      @food_glossary_kor["results"] << {"id" => f.id, "kor" => f.kor}
      puts @food_glossary_kor
    end

  render json: @food_glossary_kor
  end

end
