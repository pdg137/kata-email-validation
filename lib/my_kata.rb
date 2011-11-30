class EmailChecker
  def self.check(email)
    # check the basic structure
    return false if !(email =~ /([a-zA-Z0-9!#\$%&'*+-\/=?^_`{|}~."(),:;<>@\[\\\]]+)@([^@.][^@]*\.[^@.]{2,}\Z)/)

    local_part = $1
    domain = $2

    # check for illegal local parts
    
    # no dots at beginning or end
    return false if local_part =~ /\A\./ || local_part =~ /\.\Z/

    # check for illegal domains
    return false if domain =~ /\.\./

    # only characters allowed are letters, digits, hyphens, periods
    return false if domain =~ /[^a-zA-Z0-9.-]/
      
    return true
  end
end
