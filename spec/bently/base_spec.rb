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
      @recipe_class = Class.new(Recipe){
        def initialize; run 'echo knead the dough' end
      }
      Bently::RecipeBook.stub(:find).and_return(@recipe_class)
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
        @recipe_class = Class.new(Recipe){
          def initialize; run 'echo foobar' end
        }
        Bently::RecipeBook.stub(:find).and_return(@recipe_class)
      end

      it "performs the operation" do
        @bently.should_receive(:run).with('echo foobar').and_return(nil)
        @bently.bake 'recipe'
      end
    end


    context "given a create operation" do
      before do
        @recipe_class = Class.new(Recipe){
          def initialize; create 'file.rb', 'abc' end
        }
        Bently::RecipeBook.stub(:find).and_return(@recipe_class)
      end

      it "performs the operation" do
        @bently.should_receive(:create_file).with('file.rb','abc')
        @bently.bake 'recipe'
      end
    end


    context "given a modify operation" do
      before do
        @recipe_class = Class.new(Recipe){
          def initialize; modify 'file.rb', /dog/, 'abc' end
        }
        Bently::RecipeBook.stub(:find).and_return(@recipe_class)
      end

      it "performs the operation" do
        @bently.should_receive(:gsub_file).with('file.rb', /dog/, 'abc')
        @bently.bake 'recipe'
      end
    end


    context "given an append operation" do
      before do
        @recipe_class = Class.new(Recipe){
          def initialize; append 'file.rb', 'abc' end
        }
        Bently::RecipeBook.stub(:find).and_return(@recipe_class)
      end

      it "performs the operation" do
        @bently.should_receive(:append_to_file).with('file.rb',"abc")
        @bently.bake 'recipe'
      end
    end


    context "given a prepend operation" do
      before do
        @recipe_class = Class.new(Recipe){
          def initialize; prepend 'file.rb', 'abc' end
        }
        Bently::RecipeBook.stub(:find).and_return(@recipe_class)
      end

      it "performs the operation" do
        @bently.should_receive(:prepend_to_file).with('file.rb',"abc")
        @bently.bake 'recipe'
      end
    end


    context "given an insert operation" do
      before do
        @recipe_class = Class.new(Recipe){
          def initialize; insert 'file.rb', 'abc', :after => 'whatever\n' end
        }
        Bently::RecipeBook.stub(:find).and_return(@recipe_class)
      end

      it "performs the operation" do
        @bently.should_receive(:insert_into_file).with('file.rb','abc',:after => 'whatever\n')
        @bently.bake 'recipe'
      end
    end


    context "given a remove operation" do
      before do
        @recipe_class = Class.new(Recipe){
          def initialize; remove 'file.rb' end
        }
        Bently::RecipeBook.stub(:find).and_return(@recipe_class)
      end

      it "performs the operation" do
        @bently.should_receive(:remove_file).with('file.rb')
        @bently.bake 'recipe'
      end
    end

  end

end
