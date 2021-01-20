---
layout: default
---

# Overview
For a "Game Design and Development" course, we were asked to design and develop
our own game from scratch with our game engine of choice. We tried playing
around with Unity3D before which made us more keen to try another engine for the
sake of curiosity, so we chose godot to learn.

## Important godot terminology:

### Scenes
<div class=text-justify>
In godot, everything is a scene. While that may seem a bit intimidating at first, it helps to think of a scene as a class in an object-oriented context. So basically, every type of object is its own class that you can edit (in the editor), inherit from, instantiate, ..etc.
</div>

### Nodes
<div class=text-justify>
Each scene consists of a root node and multiple other nodes that are arranged in a hierarchical manner under the root. If we think of it in an object-oriented context (as we did for the Scenes), this hierarchy can be seen as a simple class where the root is the actual class and its children are other classes that it inherits through composition.
</div>

<br>
<span style="color: red; font-weight: bold;">TODO:</span>
Add a picture of a simple spatial node containing a mesh, a rigidbody, a collider and another node. <br><br>

<div class=text-justify>
With that out of the way, we can start talking about the idea of our game. While we can't remember the exact thought process that happened and led to the current game state, we remember that we first wanted a zombie game. Not having a lot of time that we can dedicate exclusively to the development of this game, we started thinking about ideas that wouldn't be time-consuming to implement and that would still be a bit interesting gameplay-wise.
</div>


# User Interface
## Start Menu
### Three buttons
### Settings Button
## Game UI
### Score
### Healthbar
### Ammo UI
### Pause
### Crosshair

# Modeling
## World Scene
### Trees
### Lighting

## Player Scene
<div class=text-justify>
The first thing that we thought about was the player himself. Due to this being a first-person game, we didn't need a full model for the player, only a couple of arms. For the arms, we used <span style="color:red">****</span> fully rigged model, which can be found at <span style="color:red">****</span>.
<p style="color:red; font-weight: bold">[[TODO: Picture of the arms model]]</p>
After playing around with blender for a while, we ended up with an animated set of arms that are ready to be used in the game.
<p style="color:red; font-weight: bold">[[TODO: GIF of an arbitrary arm animation in blender]]</p>
Then, it was time to get a revolver for the player to shoot zombies with. We used <span style="color:red">[[add info about model]]</span>. And for the bullet, we used <span style="color:red">[[add info about model]]</span>.

Now that we have the models, we're more than ready to start implementing the logic for the player. We added the usual FPS player controller script where the player has the ability to move around and jump using the keyboard and look around using the mouse.

For the shooting action, we needed to play the animation and spawn the bullet. However, calling them in a row would mean that the bullet will be spawned before the shooting animation started playing. Godot's animation clips have different types of animation tracks, one of which is the "Call Method Track". This track has the interesting feature that each of its key-frames is a method that will be called by the animation player as soon as it reaches that specific instance of the animation. (Not very different from Unity's AnimationEvent but we thought it was a bit more convenient to use.) By using that, we were to abstract the shooting action into simply playing the shooting animation and guaranteeing that it will delay the spawning of the bullet until it's the right time. Turning this:
<p style="color:red; font-weight: bold">[[GIF of shooting animation with method called at t=0]]</p>

into this
<p style="color:red; font-weight: bold">[[GIF of shooting animation with method calling delayed]]</p>
</div>

#### Evolution of a bullet:
The bullet started out as a simple rigidbody that would be given an initial velocity and sent on its way. However, this didn't work out as intended due to *tunneling*.

**Tunneling** is a limitation of discrete collision detection due to the physics engine detecting the collisions that occur at specific frames of time and not detecting what happens in between those frames. An effect that high speed (and small) are most susceptible to.

So we were shooting zombies and it wasn't affecting them most of the time. Of course, the first thing that we thought of was to enable continuous collision detection for the bullets. However, there seemed to be problems with continuous collision detection in godot (we found a couple of open github issues that mention that). Knowing that we can't detect bullet collision using simple colliders and rigidbodies, it was quite obvious that we had two options and both of them involved *raycasts*.

**Raycasts** are rays that are sent from an *origin* into a specific *direction* and are then traced to find the first body with which they collided.

The first option was to attach a raycast to each bullet and set the ray length to the distance that the bullet will move each frame. By handling ray-hits as bullet collisions, there would be no point in the path taken by the bullet that will not be checked for collision.

The second option would be to simply have a raycast from the camera into the direction of the crosshair. Whenever a shooting action is initiated, the raycast is checked to see if it hits something and if it does, then this is handled as a bullet-hit to that object.

We went with the second option. As for the reason, there is none. While there are pros and cons for each option, none of these are actually relevant in the scope of this game.

There was only a single problem with this option: the lack of a bullet was a bit weird.

<p style="color:red; font-weight: bold">[[GIF of shooting with no bullet]]</p>

So we added a simple bullet model as visual feedback for the shooting action.

<p style="color:red; font-weight: bold">[[GIF of shooting with a bullet as visual feedback]]</p>

<p style="color:red; font-weight: bold">NEXT: AnimationTree and state machine</p>



### Player Animation Tree
## Zombie Scene
### Zombie Animation Tree
## Tower Scene
## Revolver Scene

# Interactions
## Player Scripts
### Firing and Aiming
### Movement
## Zombie Scripts
### Movement
### Getting Hit
