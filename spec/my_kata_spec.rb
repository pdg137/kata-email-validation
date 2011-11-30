# -*- coding: utf-8 -*-
require_relative 'spec_helper'
require 'my_kata'

describe EmailChecker do
  it "should have a method :check" do
    EmailChecker.should respond_to :check
  end

  good_emails = <<END
bob@bob.com
pdg@alum.mit.edu
david@pololu.com
DAVID@POLOLU.COM
bob123.!#\$%&'*+-/=?^_`{|}~@test.com
END

  good_emails.split.each do |good_email|
    it "should return true on #{good_email}" do
      EmailChecker.check(good_email).should be true
    end
  end

  bad_emails = <<END
bob
bob@bob
@bob
a@@b.com
a@b.c
a@b..com
a@b.cd.e
a@.b.com
a@b.com.
@b.com
a@b.{}.com
привет@test.com
test@алло.com
.paul@grayson.com
paul.@grayson.com
"paul@grayson.com
END

  bad_emails.split.each do |bad_email|
    it "should return false given #{bad_email}" do
      EmailChecker.check(bad_email).should be false
    end
  end
end
