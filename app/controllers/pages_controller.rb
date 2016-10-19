class PagesController < ApplicationController

  def about
  end

  def faq
    @faqs = JSON.parse((File.read("#{Rails.root}/public/json/faq.json")))
  end

  def feedback
    @comments = JSON.parse((File.read("#{Rails.root}/public/json/comments.json")))
  end

  def welcome
  end
end
