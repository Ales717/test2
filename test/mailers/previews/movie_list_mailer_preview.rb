# Preview all emails at http://localhost:3000/rails/mailers/movie_list_mailer
class MovieListMailerPreview < ActionMailer::Preview
    def sample_mail_preview
        MovieListMailer.sample_email()
      end
end
