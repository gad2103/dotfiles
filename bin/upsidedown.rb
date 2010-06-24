#!/usr/bin/env camping

require 'rubygems'
require 'camping'

Camping.goes :Upsidedown

module Upsidedown::Controllers
  class Index < R '/(.*)'
    def get(q)
      down = "ɐqɔpǝɟɓɥıſʞƮɯuodbɹsʇnʌʍzʎz"
      up   = "abcdefghijklmnopqrstuvwxyz"

      q.empty? and q = up
      @output = q.downcase.reverse.tr(up, down)
      render :index
    end
  end
end

module Upsidedown::Views
  def layout
    html do
      head do
        meta("http-equiv" => "Content-Type", "content" => "text/html; charset=utf-8")
      end
      body do
        self << yield
      end
    end
  end

  def index
    div @output
  end
end


