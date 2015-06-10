require "rails_helper"

feature "user watchlist" do
  context "a registered logged in user" do
      let!(:user) { User.create(uid: "123",
                                username: "Jack Nicholson",
                                email: "crazyman@email.com")
                                }

      let!(:movie)          { Movie.create(title: "Avatar",
                                           imdb_id: "12")
                                          }

    it "can mark a movie as watched" do
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

      user_watchlist_movie = UserWatchlist.create(user_id: user.id, movie_id: movie.id)

      visit user_watchlists_path


      expect(user_watchlist_movie.watched?).to be false
      expect(page).to have_content(movie.title)

      click_link "remove"

      expect(page).not_to have_content(movie.title)

    end
  end
end
