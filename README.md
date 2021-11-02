# MontyHallProblem

## Welcome to the 70s! 🕺

That is a charmful decade with many colors patterns, disco music, and other cultural expressions that we refer to as vintage.

In this era, game shows were on their peaks. One of the most famous was Let's Make a Deal, presented by the emblematic Monty Hall. 

On this show, there was a game with three doors. Two had goats behind them, and only one had a car. The contestant had to choose a door. Then Monty opened another, showing a Goat. Finally, the player had to decide to keep the first choice or switch to the other closed door.

What would you do?

![Image of AppImage](Resources/appImage1.png)

This problem became a legend in mathematics, becoming a reason for countless discussions and probably some broken friendships. But now, you will understand for once and for all what to do.

## Technicalities:

* Model:  Despite the game show only having 3 doors, this problem has a higher potential. So I developed a generic model that constructs a Monty Hall Problem with any given number of doors. Greater the number, clearly the logical answer gets. It also tracks your history and can simulate a custom number of games.

* Observer Pattern: I chose to use this pattern to make the app responsive as possible. For example, when the controller indicates to open a door on the model, the view is automatically notified, and it opens visually too.

![Image of Observer](Resources/observer.png)

* State Machine: I created a state machine to coordinate all in-game interactions. By dividing the game into states and events, it becomes trivial to control the actions.

![Image of StateMahine](Resources/StateMachine.png)
