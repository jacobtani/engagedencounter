require 'sib-api-v3-sdk'

class RegisteredCoupleMailer < ApplicationMailer
  default :from => "engagedencounterwellington@gmail.com"

  def registration_confirmation(registered_couple:)
		email_data = {
			subject: 'Registration Confirmation to Engaged Encounter',
			to: to(registered_couple),
      replyTo: SibApiV3Sdk::SendSmtpEmailReplyTo.new(
        email: "engagedencounterwellington@gmail.com",
        name: "Engaged Encounter Wellington",
      ),
			htmlContent: html(registered_couple),
      sender: SibApiV3Sdk::SendSmtpEmailSender.new(
        email: "engagedencounterwellington@gmail.com",
        name: "Engaged Encounter Wellington"
      )
		}

		result = api_instance.send_transac_email(email_data)
    puts result
  rescue SibApiV3Sdk::ApiError => e
	  puts "REGISTERED COUPLE MAILER: Exception when calling TransactionalEmailsApi->send_transac_email: #{e}"
  end

  private

  def api_instance
		@api_instance ||= SibApiV3Sdk::TransactionalEmailsApi.new
  end

	def to(registered_couple)
    [
      {email: registered_couple.email, name: registered_couple.full_name_no_blanks}
    ]
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
      																		<p class="h2" style="margin-top:0;margin-bottom:0;margin-right:0;margin-left:0;font-size:20px;line-height:20px;"><b>Registration Confirmation to Engaged Encounter</b></p>
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
      											<p style="margin-top:0;margin-right:0;margin-left:0;margin-bottom:12px;">Dear ' + registered_couple.first_name + ',</p>
      											<p style="margin-top:0;margin-right:0;margin-left:0;margin-bottom:12px;">This is to confirm your registration to an Engaged Encounter weekend on ' + registered_couple.event.event_date.to_s + '. We look forward to meeting you on this weekend.</p>
      											<p style="margin-top:0;margin-right:0;margin-left:0;margin-bottom:12px;">The weekend is held at St Teresas Presbytery, 301 Karori Road, Karori, Wellington. It is a warm and comfortable venue. We want you to feel relaxed and comfortable on the weekend and recommend casual clothing.</p>
      											<p style="margin-top:0;margin-right:0;margin-left:0;margin-bottom:12px;">The event runs from Saturday 8am - 8pm and Sunday 8.45am - 4pm. Please note that breakfast is not provided but the rest of the weekend is fully catered.</p>
      											<p style="margin-top:0;margin-right:0;margin-left:0;margin-bottom:12px;">In the week leading up to the weekend a member of the presenting team will phone you. Please ask them anything else you need to know to enable you to enjoy the weekend. We wish you all the very best for your EE Weekend and trust you will enjoy the time as you focus on each other and your future life together.</p>
                            <p style="margin-top:0;margin-right:0;margin-left:0;margin-bottom:12px;">Please do not hesitate to contact us if you have any further questions/concerns.</p><br>
                            <p style="margin-top:0;margin-right:0;margin-left:0;margin-bottom:12px;">Cheers,</p>
                            <p style="margin-top:0;margin-right:0;margin-left:0;margin-bottom:12px;">Simon and Kate Olsen (EE Registrars)</p>
                            <p style="margin-top:0;margin-right:0;margin-left:0;margin-bottom:12px;">engagedencounterwellington@gmail.com</p><br>
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
