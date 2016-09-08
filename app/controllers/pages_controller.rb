class PagesController < ApplicationController

  def welcome
  end
  
  def faq
    @faqs = JSON.parse((File.read("#{Rails.root}/app/assets/javascripts/faq.json")))
  end

  def comments
    @comments = JSON.parse((File.read("#{Rails.root}/app/assets/javascripts/comments.json")))
  end
end