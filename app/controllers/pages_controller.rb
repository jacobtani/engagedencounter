class PagesController < ApplicationController

  def the_weekend
  end

  def contact_us
  end

  def links
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
