class RegisteredCouplesPdf < Prawn::Document
  include ActionView::Helpers::NumberHelper

  def initialize(registered_couples:)
    super page_size: "A4", page_layout: :landscape, bottom_margin: 1, left_margin: 1, top_margin: 1, right_margin: 1
    @registered_couples = registered_couples
    fill_color "000000"
    font_size 10
    move_down 20
    text "REGISTERED COUPLES", size: 20
    build_registered_couples_table
  end

  def build_registered_couples_table
    move_down 20
    table(registered_couples_rows) do
      cells.borders = []
      row(0).border_width = 1
      row(0).font_style = :bold
    end
  end

  def registered_couples_rows
    [["Name", "Pref Name", "Age", "Address", "Phone", "Email", "Religion-Parish", "FianceName", "Fiance PrefName", "FianceAge", "FianceAddress", "FiancePhone", "FianceEmail", "FianceReligion-Parish", "Post-Wedding-Address", "WeddingDate", "Event", "DietaryReqs"]] +
     @registered_couples.map do |registered_couple|
       [
         [ registered_couple.first_name, registered_couple.surname ].join("\n"),
         registered_couple.preferred_name,
         registered_couple.age,
         registered_couple.address,
         registered_couple.phone_number,
         registered_couple.email,
         [registered_couple.religion, registered_couple.parish].join('-'),
         [ registered_couple.fiance_first_name, registered_couple.fiance_surname ].join("\n"),
         registered_couple.fiance_preferred_name,
         registered_couple.fiance_age,
         registered_couple.fiance_address,
         registered_couple.fiance_phone_number,
         registered_couple.fiance_email,
         [registered_couple.fiance_religion, registered_couple.fiance_parish].join('-'),
         registered_couple.post_wedding_address,
         registered_couple.wedding_date,
         Event.find(registered_couple.preferred_event).start_date,
         registered_couple.dietary_requirements
       ]
     end
  end
end
