class Attendee
  def initialize(height)
    @height = height
  end

  def height
    @height
  end

  def pass_id
    @pass_id
  end

  def issue_pass!(pass_id)
    @issue_pass = true
  end

  def revoke_pass!
    @pass_id =nil
  end
end
