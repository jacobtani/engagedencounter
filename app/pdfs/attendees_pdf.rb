class AttendeesPdf < Prawn::Document
  include ActionView::Helpers::NumberHelper

  def initialize(attendees:)
    super page_size: "A4", page_layout: :landscape, bottom_margin: 1, left_margin: 1, top_margin: 1, right_margin: 1
    @attendees = attendees
    fill_color "000000"
    font_size 10
    move_down 20
    text "REGISTERED ATTENDEES", size: 20
    build_attendees_table
  end

  def build_attendees_table
    move_down 20
    table(attendees_rows) do
      cells.borders = []
      row(0).border_width = 1
      row(0).font_style = :bold
    end
  end

  def attendees_rows
    [["Name", "Preferred Name", "Age", "Address", "Phone", "Email", "Religion-Parish", "Post-Wedding-Address", "WeddingDate", "FianceName", "Event", "DietaryReqs"]] +
     @attendees.map do |attendee|
       [
         [ attendee.first_name, attendee.surname ].join("\n"),
         attendee.preferred_name,
         attendee.age,
         attendee.address,
         attendee.phone_number,
         attendee.email,
         [attendee.religion, attendee.parish].join('-'),
         attendee.post_wedding_address,
         attendee.wedding_date,
         attendee.fiance_full_name,
         Event.find(attendee.preferred_event).start_date,
         attendee.dietary_requirements
       ]
     end
  end
end
