require 'sib-api-v3-sdk'

class OrganiserMailer < ApplicationMailer
  default :to => "engagedencounterwellington@gmail.com"

  def send_enquiry(message:)
    message_args = {
      subject: 'Enquiry from EE Website',
      htmlContent: "<!DOCTYPE html><html><body><h1>New Enquiry on EE Website</h1><p>#{message.content}</p></body></html>",
      sender: SibApiV3Sdk::SendSmtpEmailSender.new(
        email: message.email,
        name: message.full_name
      ),
      to: [{email: 'engagedencounterwellington@gmail.com', name: 'Engaged Encounter Wellington'}],
      # TODO: not sure this is the correct reply to.
      replyTo: SibApiV3Sdk::SendSmtpEmailReplyTo.new(
        email: "engagedencounterwellington@gmail.com",
        name: "Engaged Encounter Wellington",
      ),
      # 'to'=> [{'email'=>'engagedencounterwellington@gmail.com','name'=>'Engaged Encounter Wellington'}],
      # 'replyTo'=> {'email'=>'engagedencounterwellington@gmail.com','name'=>'Engaged Encounter Wellington'}
    }
    send_smtp_email = SibApiV3Sdk::SendSmtpEmail.new(message_args) # SendSmtpEmail | Values to send a transactional email

    result = api_instance.send_transac_email(send_smtp_email)
    p result
  rescue SibApiV3Sdk::ApiError => e
    output_error(e)
  end

  def new_registration(registered_couple:)
    message_args = {
      subject: 'New Registration to Engaged Encounter',
      htmlContent: html(registered_couple),
      # to: [{'email'=>'engagedencounterwellington@gmail.com','name'=>'Engaged Encounter Wellington'}],
      to: [{email: 'engagedencounterwellington@gmail.com', name: 'Engaged Encounter Wellington'}],
      replyTo: SibApiV3Sdk::SendSmtpEmailReplyTo.new(
        email: "engagedencounterwellington@gmail.com",
        name: "Engaged Encounter Wellington",
      ),
      sender: SibApiV3Sdk::SendSmtpEmailSender.new(
        email: "engagedencounterwellington@gmail.com"
      )
    }

    send_smtp_email = SibApiV3Sdk::SendSmtpEmail.new(message_args)
    result = api_instance.send_transac_email(send_smtp_email)
    p result
  rescue SibApiV3Sdk::ApiError => e
    binding.pry
    output_error(e)
  end

  private

  def output_error(e)
    puts "ORGANISER MAILER: Exception when calling TransactionalEmailsApi->send_transac_email: #{e}"
    puts e.response_body
    puts e.response_headers
  end

  def api_instance
    @api_instance ||= SibApiV3Sdk::TransactionalEmailsApi.new
  end

  def html(registered_couple)
    '
    <!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
           <html xmlns="http://www.w3.org/1999/xhtml">
           <head>
           	<meta http-equiv="X-UA-Compatible" content="IE=edge" />
           	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
           	<meta name="viewport" content="width=device-width, initial-scale=1.0" />
           	<link href="https://fonts.googleapis.com/css?family=Lato:400,400i,700,700i" rel="stylesheet" />
           	<title></title>
           	<style type="text/css">
           		a {
           		  text-decoration: none;
           		  color: #231f20;
           		}
           		.buttonwrapper a {
           		  border-top: 12px solid #ed1b2d;
           		  border-bottom: 12px solid #ed1b2d;
           		  border-left: 25px solid #ed1b2d;
           		  border-right: 25px solid #ed1b2d;
           		  color: #ffffff;
           		  display: inline-block;
           		  text-decoration: none;
           		}
           		.section-masthead .contents a {
           		  color: #ffffff;
           		}
           		.section-main a {
           		  color: #ed1b2d;
           		  text-decoration: underline;
           		}
           		@media screen and (max-width: 499px) {
           		  .inner {
           		    padding-left: 20px !important;
           		    padding-right: 20px !important;
           		  }
           		  .h2 {
           		    font-size: 18px !important;
           		    line-height: 1.2em !important;
           		  }
           		  .h1 {
           		    margin-bottom: 20px !important;
           		  }
           		  .two-col-sidebar .left {
           		    max-width: 50% !important;
           		  }
           		  .two-col-sidebar .right {
           		    max-width: 50% !important;
           		  }
           		  .section-main .inner {
           		    padding-top: 28px !important;
           		  }
           		}
           		@media screen and (min-width: 500px) and (max-width: 595px) {
           		  .two-col-sidebar .left {
           		    max-width: 70% !important;
           		  }
           		  .two-col-sidebar .right {
           		    max-width: 30% !important;
           		  }
           		}
           		@media screen and (max-width: 625px) {
           		  .hide {
           		    display: none !important;
           		  }
           		  .outerpad {
           		    padding: 0 !important;
           		  }
           		  .section-masthead .inner {
           		    padding: 20px !important;
           		  }
           		  .two-col-sidebar .buffered,
           		  .two-col-sidebar .inner {
           		    padding-left: 10px !important;
           		    padding-right: 10px !important;
           		  }
           		  .button a {
           		    border: 0 !important;
           		    padding: 13px !important;
           		    display: block !important;
           		  }
           		}
           		div[style*="margin: 16px 0"] {
           		  margin: 0 !important;
           		}
           		a[x-apple-data-detectors=true] {
           		  cursor: default;
           		  text-decoration: none !important;
           		  color: inherit !important;
           		}
           		.preheader {display: none;}
           	</style>
           </head>
           <body style="font-family:Lato, sans-serif;margin-top:0;margin-bottom:0;margin-right:0;margin-left:0;padding-top:0;padding-bottom:0;padding-right:0;padding-left:0;background-color:#f6f6f6;-webkit-font-smoothing:antialiased;-moz-osx-font-smoothing:grayscale;">
           <div class="preheader" style="mso-hide:all;visibility:hidden;opacity:0;color:transparent;mso-line-height-rule:exactly;line-height:0;font-size:0;overflow:hidden;border-width:0;display:none !important;"></div>
           <center>
           	<table width="100%" cellpadding="0" cellspacing="0" align="center" border="0" class="wrapper" style="margin-top:0;margin-bottom:0;margin-right:auto;margin-left:auto;table-layout:fixed;width:100%;-webkit-text-size-adjust:100%;-ms-text-size-adjust:100%;background-color:#f6f6f6;">
           		<tr>
           			<td align="center" class="outerpad" style="padding-left:20px;padding-right:20px;">
           				<center>
           					<table width="100%" cellpadding="0" cellspacing="0" border="0" class="outer" style="margin-top:0;margin-bottom:0;margin-right:auto;margin-left:auto;width:100%;max-width:580px;">
           						<tr>
           							<td>
           								<table width="100%" border="0" cellpadding="0" cellspacing="0" bgcolor="#4c4c4c"  class="section-bar" style="border-bottom-width:3px;border-bottom-style:solid;border-bottom-color:#231f20;">
           									<tr class="two-col-sidebar">
           										<td class="inner" style="padding-top:13px;padding-left:15px;padding-right:15px;">
           											<table cellpadding="0" cellspacing="0" border="0" width="100%" class="contents" style="font-family:Lato, sans-serif;text-align:left;font-size:20px;line-height:24px;color:#ffffff;">
           												<tr>
           													<td class="container" style="font-size:0;text-align:left;">
           														<div class="column left" style="display:inline-block;vertical-align:middle;width:100%;max-width:391px;">
           															<table cellpadding="0" cellspacing="0" border="0" width="100%" class="contents" style="font-family:Lato, sans-serif;text-align:left;font-size:20px;line-height:24px;color:#ffffff;">
           																<tr>
           																	<td class="buffered" style="padding-top:0;padding-bottom:13px;padding-right:15px;padding-left:15px;">
           																		<p class="h2" style="margin-top:0;margin-bottom:0;margin-right:0;margin-left:0;font-size:20px;line-height:20px;"><b>NEW REGISTRATION TO EE WEEKEND</b></p>
           																	</td>
           																</tr>
           															</table>
           														</div><!--[if (mso)|(IE)]></td><td width="30%"><![endif]--><div class="column right" style="display:inline-block;vertical-align:middle;width:100%;max-width:159px;">
           															<table cellpadding="0" cellspacing="0" border="0" width="100%">
           																<tr>
           																	<td class="buffered" style="padding-top:0;padding-bottom:13px;padding-right:15px;padding-left:15px;"></td>
           																</tr>
           															</table>
           														</div>
           													</td>
           												</tr>
           											</table>
           										</td>
           									</tr>
           								</table>
           								<table width="100%" cellpadding="0" cellspacing="0" border="0" class="contents section-main" align="center" style="font-family:Lato, sans-serif;text-align:left;font-size:14px;line-height:19px;background-color:#ffffff;border-left-width:1px;border-left-style:solid;border-left-color:#f2f2f2;border-right-width:1px;border-right-style:solid;border-right-color:#f2f2f2;border-bottom-width:1px;border-bottom-style:solid;border-bottom-color:#f2f2f2;">
           									<tr class="one-col">
           										<td class="inner" style="padding-top:33px;padding-bottom:33px;padding-right:30px;padding-left:30px;">
           											<p style="margin-top:0;margin-right:0;margin-left:0;margin-bottom:12px;">Dear Simon & Kate,</p>
           											<p style="margin-top:0;margin-right:0;margin-left:0;margin-bottom:12px;">A new registered couple has registered for an Engaged Encounter Weekend. Their details are as follows:</p>
           											<p style="margin-top:0;margin-right:0;margin-left:0;margin-bottom:12px;"><b>Name:</b> ' + [registered_couple.first_name, registered_couple.surname].reject(&:empty?).join(' ') + '</p>
                                <p style="margin-top:0;margin-right:0;margin-left:0;margin-bottom:12px;"><b>Preferred Name:</b> ' + registered_couple.preferred_name + '</p>
                                <p style="margin-top:0;margin-right:0;margin-left:0;margin-bottom:12px;"><b>Age:</b> ' + registered_couple.age.to_s + '</p>
                                <p style="margin-top:0;margin-right:0;margin-left:0;margin-bottom:12px;"><b>Address:</b> ' + registered_couple.address + '</p>
                                <p style="margin-top:0;margin-right:0;margin-left:0;margin-bottom:12px;"><b>Phone Number:</b> ' + registered_couple.phone_number + '</p>
                                <p style="margin-top:0;margin-right:0;margin-left:0;margin-bottom:12px;"><b>Email:</b> ' + registered_couple.email + '</p>
                                <p style="margin-top:0;margin-right:0;margin-left:0;margin-bottom:12px;"><b>Religion:</b> ' +  registered_couple.religion + '</p>
                                <p style="margin-top:0;margin-right:0;margin-left:0;margin-bottom:12px;"><b>Parish:</b> ' +  registered_couple.parish + '</p>
                                <p style="margin-top:0;margin-right:0;margin-left:0;margin-bottom:12px;"><b>Name:</b> ' + [registered_couple.fiance_first_name, registered_couple.fiance_surname].reject(&:empty?).join(' ') + '</p>
                                <p style="margin-top:0;margin-right:0;margin-left:0;margin-bottom:12px;"><b>Fiance Preferred Name:</b> ' + registered_couple.fiance_preferred_name + '</p>
                                <p style="margin-top:0;margin-right:0;margin-left:0;margin-bottom:12px;"><b>Age:</b> ' + registered_couple.fiance_age.to_s + '</p>
                                <p style="margin-top:0;margin-right:0;margin-left:0;margin-bottom:12px;"><b>Address:</b> ' + registered_couple.fiance_address + '</p>
                                <p style="margin-top:0;margin-right:0;margin-left:0;margin-bottom:12px;"><b>Phone Number:</b> ' + registered_couple.fiance_phone_number + '</p>
                                <p style="margin-top:0;margin-right:0;margin-left:0;margin-bottom:12px;"><b>Email:</b> ' + registered_couple.fiance_email + '</p>
                                <p style="margin-top:0;margin-right:0;margin-left:0;margin-bottom:12px;"><b>Religion:</b> ' +  registered_couple.fiance_religion + '</p>
                                <p style="margin-top:0;margin-right:0;margin-left:0;margin-bottom:12px;"><b>Parish:</b> ' +  registered_couple.fiance_parish + '</p>
                                <p style="margin-top:0;margin-right:0;margin-left:0;margin-bottom:12px;"><b>Wedding Date:</b> ' + registered_couple.wedding_date.strftime('%-d %B %Y') + '</p>
                                <p style="margin-top:0;margin-right:0;margin-left:0;margin-bottom:12px;"><b>Preferred Weekend:</b> ' +  registered_couple.event.event_date.to_s + '</p>
                                <p style="margin-top:0;margin-right:0;margin-left:0;margin-bottom:12px;"><b>Post Wedding Address:</b> ' +  registered_couple.post_wedding_address + '</p>
                                <p style="margin-top:0;margin-right:0;margin-left:0;margin-bottom:12px;"><b>Dietary Requirements:</b> ' +  registered_couple.dietary_requirements + '</p><br>
                                <p style="margin-top:0;margin-right:0;margin-left:0;margin-bottom:12px;">Cheers,</p>
                                <p style="margin-top:0;margin-right:0;margin-left:0;margin-bottom:12px;">EE Website</p>
           										</td>
           									</tr>
           								</table>
           							</td>
           						</tr>
           					</table>
           				</center>
           			</td>
           		</tr>
           	</table>
           	<div class="spacer hide" style="font-size:20px;line-height:20px;display:block;">&nbsp;</div>
           </center>
           </body>
           </html>
          '
  end
end
