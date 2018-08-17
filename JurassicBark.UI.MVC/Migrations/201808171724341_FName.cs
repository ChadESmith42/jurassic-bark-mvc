namespace JurassicBark.UI.MVC.Migrations
{
    using System;
    using System.Data.Entity.Migrations;
    
    public partial class FName : DbMigration
    {
        public override void Up()
        {
            AddColumn("dbo.AspNetUsers", "FName", c => c.String());
            AddColumn("dbo.AspNetUsers", "LName", c => c.String());
            AddColumn("dbo.AspNetUsers", "Address", c => c.String());
            AddColumn("dbo.AspNetUsers", "City", c => c.String());
            AddColumn("dbo.AspNetUsers", "State", c => c.String());
            AddColumn("dbo.AspNetUsers", "ZipCode", c => c.String());
            AddColumn("dbo.AspNetUsers", "BirthDay", c => c.DateTime(nullable: false));
        }
        
        public override void Down()
        {
            DropColumn("dbo.AspNetUsers", "BirthDay");
            DropColumn("dbo.AspNetUsers", "ZipCode");
            DropColumn("dbo.AspNetUsers", "State");
            DropColumn("dbo.AspNetUsers", "City");
            DropColumn("dbo.AspNetUsers", "Address");
            DropColumn("dbo.AspNetUsers", "LName");
            DropColumn("dbo.AspNetUsers", "FName");
        }
    }
}
