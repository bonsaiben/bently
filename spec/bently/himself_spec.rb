require 'spec_helper'

describe Bently::Himself do

  before do
    @bently = Bently::Himself.new
    @bently.stub(:`)
    @bently.stub(:create_file)
    @bently.stub(:append_to_file)
    @bently.stub(:prepend_to_file)
    @bently.stub(:gsub_file)
    @bently.stub(:insert_into_file)
    @bently.stub(:yes?)
    @bently.stub(:ask)
  end

  describe "#read" do
    before do
      @recipe_class = Class.new(Bently::Recipe){
        step :shell, 'echo knead the dough'
      }
      Bently::RecipeBook.stub(:find).and_return(@recipe_class)
    end

    it "outputs the step" do
      out = capture_stdout do
        @bently.read 'recipe'
      end

      out.string.should_not be_blank
    end

    it "doesn't execute any commands" do
      @bently.should_receive(:`).exactly(0).times
      @bently.read 'recipe'
    end
  end


  describe "#bake" do
    before do
      STDOUT.stub(:puts).and_return(true)
      @bently.stub(:yes?).and_return(true)
    end

    context "given an shell step" do
      before do
        @recipe_class = Class.new(Bently::Recipe){
          step :shell, 'echo command'
        }
        Bently::RecipeBook.stub(:find).and_return(@recipe_class)
      end

      it "executes the step" do
        @bently.should_receive(:`).with('echo command').and_return(nil)
        @bently.bake 'recipe'
      end
    end

    context "given a touch step" do
      before do
        @recipe_class = Class.new(Bently::Recipe){
          step :touch, :file => 'file.rb', :with => 'abc'
        }
        Bently::RecipeBook.stub(:find).and_return(@recipe_class)
      end

      it "executes the step" do
        @bently.should_receive(:create_file).with('file.rb','abc')
        @bently.bake 'recipe'
      end
    end

    context "given a modify step" do
      before do
        @recipe_class = Class.new(Bently::Recipe){
          step :modify, :file => 'file.rb', :from => /dog/, :to => 'abc'
        }
        Bently::RecipeBook.stub(:find).and_return(@recipe_class)
      end

      it "executes the step" do
        @bently.should_receive(:gsub_file).with('file.rb',/dog/,'abc')
        @bently.bake 'recipe'
      end
    end

    context "given an append step" do
      before do
        @recipe_class = Class.new(Bently::Recipe){
          step :append, :file => 'file.rb', :with => 'abc'
        }
        Bently::RecipeBook.stub(:find).and_return(@recipe_class)
      end

      it "executes the step" do
        @bently.should_receive(:append_to_file).with('file.rb',"abc\n")
        @bently.bake 'recipe'
      end
    end

    context "given a prepend step" do
      before do
        @recipe_class = Class.new(Bently::Recipe){
          step :prepend, :file => 'file.rb', :with => 'abc'
        }
        Bently::RecipeBook.stub(:find).and_return(@recipe_class)
      end

      it "executes the step" do
        @bently.should_receive(:prepend_to_file).with('file.rb',"\nabc")
        @bently.bake 'recipe'
      end
    end

    context "given an insert step" do
      before do
        @recipe_class = Class.new(Bently::Recipe){
          step :insert, :file => 'file.rb', :with => 'abc', :after => 'whatever\n'
        }
        Bently::RecipeBook.stub(:find).and_return(@recipe_class)
      end

      it "executes the step" do
        @bently.should_receive(:insert_into_file).with('file.rb','abc',:after => 'whatever\n')
        @bently.bake 'recipe'
      end
    end

    context "given a remove step" do
      before do
        @recipe_class = Class.new(Bently::Recipe){
          step :remove, :file => 'file.rb'
        }
        Bently::RecipeBook.stub(:find).and_return(@recipe_class)
      end

      it "executes the step" do
        @bently.should_receive(:remove_file).with('file.rb')
        @bently.bake 'recipe'
      end
    end

    context "given a custom step" do
      before do
        @recipe_class = Class.new(Bently::Recipe){
          step :add_gem, "gem 'wallabe'"
          def add_gem(*args); shell("echo #{args.first}") end
        }
        Bently::RecipeBook.stub(:find).and_return(@recipe_class)
      end

      it "executes the step" do
        @bently.should_receive(:`).with("echo gem 'wallabe'")
        @bently.bake 'recipe'
      end
    end

    context "given a shell step with a lambda" do
      before do
        @recipe_class = Class.new(Bently::Recipe){
          step :shell, lambda{|x| "echo #{x}" }
        }
        Bently::RecipeBook.stub(:find).and_return(@recipe_class)
      end

      it "executes the step" do
        @bently.should_receive(:`).with("echo wallabe")
        @bently.should_receive(:ask).and_return("wallabe")
        @bently.bake 'recipe'
      end
    end
  end

end
