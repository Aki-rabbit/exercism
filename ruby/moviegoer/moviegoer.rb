# This is a custom exception that you can use in your code
class NotMovieClubMemberError < RuntimeError
end

class Moviegoer
  def initialize(age, member: false)
    @age = age
    @member = member
  end

  def ticket_price
    #60歳以上の人はチケットが10.00ドルになります。
    #それより若い人は、15.00ドルの全額を支払います。
    @age >= 60? 10.00 : 15.00
  end

  def watch_scary_movie?
    #18歳以上であれば、怖い映画を観ることができます。
    #それより若い場合、観ることはできません。
    @age >= 18? true : false
  end

  # Popcorn is 🍿
  def claim_free_popcorn!
    if @member == true
      "🍿" 
    else
      raise NotMovieClubMemberError
    end
  end
end
