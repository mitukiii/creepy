# -*- coding: utf-8 -*-

require 'yaml'

Creepy.configure do |config|
  current = File.dirname(__FILE__)
  root = File.join(current, '..')

  ## アカウント情報等の読み込み
  accounts_file = File.join(current, 'accounts.yml')
  accounts = Hashie::Mash.new(YAML.load_file(accounts_file))

  ## Logger の設定
  log_dir = File.join(root, 'log')
  log_file = File.join(log_dir, 'creepy.log')
  config.logger = Logger.new(log_file)
  config.logger.progname = Creepy
  config.logger.level = Logger::DEBUG
  config.logger.formatter = Logger::Formatter.new

  ## Twitter アカウントの設定
  config.twitter do |twitter|
    twitter.consumer_key       = accounts.twitter.consumer_key
    twitter.consumer_secret    = accounts.twitter.consumer_secret
    twitter.oauth_token        = accounts.twitter.oauth_token
    twitter.oauth_token_secret = accounts.twitter.oauth_token_secret
  end
end
