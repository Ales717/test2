class MovieListMailer < ApplicationMailer
    default from: "prosenjak.ales77@gmail.com"

    def sample_email()
        mail(to: 'prosenjak12@gmail.com', subject: 'Sample Email')
      end
end
