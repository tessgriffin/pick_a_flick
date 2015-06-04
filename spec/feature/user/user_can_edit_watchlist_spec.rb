require "rails_helper"

RSpec.describe "user watchlist" do
  context "a registered logged in user" do
      let!(:user) { User.create(uid: "123",
                                username: "Jack Nicholson",
                                email: "crazyman@email.com")
                                }

      let!(:movie)          { Movie.create(title: "Avatar",
                                           imdb_id: "12")
                                          }

      let!(:user_watchlist_movie) { UserWatchlist.create(user_id: user.id,
                                                   movie_id: movie.id)
                                                   }
    it "can mark a movie as watched" do
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)
      visit user_path(user)

      click_link "edit watchlist"

      expect(current_path).to eq(edit_user_watchlist_path)

      page.check("Watched")

      expect(user_watchlist_movie.watched?).to be true
    end
  end
end
