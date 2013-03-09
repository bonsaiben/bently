require 'spec_helper'

describe Bently::Base do

  before do
    @bently = Bently::Base.new
    @bently.stub(:`)
    @bently.stub(:run)
    @bently.stub(:create_file)
    @bently.stub(:append_to_file)
    @bently.stub(:prepend_to_file)
    @bently.stub(:gsub_file)
    @bently.stub(:insert_into_file)
    @bently.stub(:remove_file)
    @bently.stub(:yes?)
    @bently.stub(:ask)
  end


  describe "#read" do
    before do
      @recipe_class = Class.new(Bently::Recipe){
        def initialize; run 'echo knead the dough' end
      }
      Bently::Recipebook.stub(:find).and_return(@recipe_class)
    end

    it "triggers the operation" do
      @bently.should_receive(:run)
      @bently.read 'recipe'
    end

    it "doesn't execute any commands" do
      @bently.should_receive(:`).exactly(0).times
      @bently.read 'recipe'
    end
  end


  describe "#bake" do
    before do
      STDOUT.stub(:puts).and_return(true)
    end

    context "given a run operation" do
      before do
        @recipe_class = Class.new(Bently::Recipe){
          def initialize; run 'echo foobar' end
        }
        Bently::Recipebook.stub(:find).and_return(@recipe_class)
      end

      it "performs the operation" do
        @bently.should_receive(:run).with('echo foobar').and_return(nil)
        @bently.bake 'recipe'
      end
    end


    context "given a create operation" do
      before do
        @recipe_class = Class.new(Bently::Recipe){
          def initialize; create 'file.rb', 'abc' end
        }
        Bently::Recipebook.stub(:find).and_return(@recipe_class)
      end

      it "performs the operation" do
        @bently.should_receive(:create_file).with('file.rb','abc')
        @bently.bake 'recipe'
      end
    end


    context "given a modify operation" do
      before do
        @recipe_class = Class.new(Bently::Recipe){
          def initialize; modify 'file.rb', /dog/, 'abc' end
        }
        Bently::Recipebook.stub(:find).and_return(@recipe_class)
      end

      it "performs the operation" do
        @bently.should_receive(:gsub_file).with('file.rb', /dog/, 'abc')
        @bently.bake 'recipe'
      end
    end


    context "given an append operation" do
      before do
        @recipe_class = Class.new(Bently::Recipe){
          def initialize; append 'file.rb', 'abc' end
        }
        Bently::Recipebook.stub(:find).and_return(@recipe_class)
      end

      it "performs the operation" do
        @bently.should_receive(:append_to_file).with('file.rb',"abc")
        @bently.bake 'recipe'
      end
    end


    context "given a prepend operation" do
      before do
        @recipe_class = Class.new(Bently::Recipe){
          def initialize; prepend 'file.rb', 'abc' end
        }
        Bently::Recipebook.stub(:find).and_return(@recipe_class)
      end

      it "performs the operation" do
        @bently.should_receive(:prepend_to_file).with('file.rb',"abc")
        @bently.bake 'recipe'
      end
    end


    context "given an insert operation" do
      before do
        @recipe_class = Class.new(Bently::Recipe){
          def initialize; insert 'file.rb', 'abc', :after => 'whatever\n' end
        }
        Bently::Recipebook.stub(:find).and_return(@recipe_class)
      end

      it "performs the operation" do
        @bently.should_receive(:insert_into_file).with('file.rb','abc',:after => 'whatever\n')
        @bently.bake 'recipe'
      end
    end


    context "given a remove operation" do
      before do
        @recipe_class = Class.new(Bently::Recipe){
          def initialize; remove 'file.rb' end
        }
        Bently::Recipebook.stub(:find).and_return(@recipe_class)
      end

      it "performs the operation" do
        @bently.should_receive(:remove_file).with('file.rb')
        @bently.bake 'recipe'
      end
    end

  end

  describe "Recipes" do
    it "raises no errors" do
      @bently.read 'action-mailer'
      @bently.read 'active_admin'
      @bently.read 'acts-as-taggable-on'
      @bently.read 'better-errors'
      @bently.read 'cancan'
      @bently.read 'carrierwave'
      @bently.read 'cucumber-rails'
      @bently.read 'delayed-job-active-record'
      @bently.read 'delayed-job-mongoid'
      @bently.read 'devise'
      @bently.read 'factory-girl-rails'
      @bently.read 'foreman'
      @bently.read 'foreman-thin'
      @bently.read 'formtastic'
      @bently.read 'gitignore-emacs'
      @bently.read 'gitignore-linux'
      @bently.read 'gitignore-osx'
      @bently.read 'gitignore-rails'
      @bently.read 'gitignore-ruby'
      @bently.read 'gitignore-rubymine'
      @bently.read 'gitignore-sass'
      @bently.read 'gitignore-sublime-text'
      @bently.read 'gitignore-textmate'
      @bently.read 'gitignore-vim'
      @bently.read 'gitignore-windows'
      @bently.read 'guard'
      @bently.read 'guard-coffeescript'
      @bently.read 'guard-cucumber'
      @bently.read 'guard-livereload'
      @bently.read 'guard-minitest'
      @bently.read 'guard-rails'
      @bently.read 'guard-rspec'
      @bently.read 'guard-spork'
      @bently.read 'haml-rails'
      @bently.read 'heroku-cleardb'
      @bently.read 'heroku-rails'
      @bently.read 'heroku-sendgrid'
      @bently.read 'jasmine-rails'
      @bently.read 'kaminari'
      @bently.read 'minitest-rails'
      @bently.read 'omniauth'
      @bently.read 'omniauth-facebook'
      @bently.read 'paperclip'
      @bently.read 'resque-rails'
      @bently.read 'rspec-rails'
      @bently.read 'rvmrc'
      @bently.read 'simple_form'
      @bently.read 'twitter'
      @bently.read 'twitter-bootstrap-rails'
    end
  end


end
