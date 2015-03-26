//Model Component (representation of enemy data)
box2d = require("..\B2D.js");
PhysicsController = require ("..\PhysicsController.js");

var MyEnemyModel function(){
	//define your constants here
	this.H = 32;//height
	this.W = 32;
	
	//set your game logic parameters here
	this.object_id = 0; //hardcode a unique identifier for each new enemy class
	this.hp = 10;
	this.speed = 4;
	this.damage = 1;
	this.attack_cooldown = 4; //use this for enemies who need
	this.can_attack = true;//use this for enemies who alternate between 
	this.cooldown_timer=-1;
	this.AI_state = "stand";//use this to keep track of the enemy's AI state
	
	//define fixture (friction, density, etc.)
	this.fixture_def = new box2d.b2FixtureDef
	//density = (mass/volume)
	this.fixture_def.density = 1;
	//friction is what you would imagine
	this.fixture_def.friction = 1;
	//restitution = bounciness
	this.fixture_def.restitution = .5;
	//shape = the internal box2d polygon used for collision
	this.fixture_def.shape = new box2d.b2PolygonShape().AsBox(H,W);
	
	//define body (physics stuff)
	this.body_def = new box2d.b2BodyDef();
	this.body_def.type = box2d.b2Body.b2_dynamicBody;
	this.body_def.is_sensor = true;
	this.body.SetLinearVelocity(new box2d.b2Vec2(0, 0));
	
	//define sprite (the graphics)
	//values given are arbitrary defaults provided for illustration
	sprite_sheet0 = new createjs.SpriteSheet({
		"framerate": 2,
		"images": ["../Content/gamedemo/assets/art/Chompers.png"],
		"frames": { "regX": 8, "regY": 8, "height": 16, "width": 16, "count": 2 },
		"animations": {
			"run": [0, 1, "run"]
		}
	this.sprite = new createjs.sprite(sheet0, AI_state);
	/*
	NOTES ON GRAPHICS
	each sprite sheet contains a number of frames in a single animation. 
	create a new sprite_sheet object for each animation
	set this.sprite to the default starting animation
	
	framerate is the number of frames cycled per second
	images loads the actual png file from the assets folder
	frames specifies how the raw image should be partitioned to generate the actual frames 
		regX & regY are xy offsets
		height and width give the dimensions of the individual frames
		count specifies the number of frames
	You need to make sure that height*count <= the height of the original file (same for width)
	
	
	be aware that the origin of the body.shape(H/2,W/2) != the origin of the sprite (0,0)
	regX and regY are xy offsets for the sprite. use these to keep the 
	sprite in the right place relative to the box2d body
	
	*/
	
};

module.export = My_enemy_model;
