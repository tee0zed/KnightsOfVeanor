# KnightsOfVeanor

**Dont judge me hard: this game has been written on third month after my very first hello world created. I want it stay untouched.**

Step by step battlegame. 

Feel free to add your own classes and abilities or\and change forked source code. Game is completely open-source, credits added
for fun only. 

[![Run on Repl.it](https://repl.it/badge/github/tee0zed/KnightsOfVeanor)](https://replit.com/@RMenkl/KnightsOfVeanor-5)

### Requirements 
- ruby 2.6.5

### Usage 

Just run `ruby main.rb` from the parent folder.

#### Adding own class

To add class just copy one in `lib/heroes` and change stats to desired, don't forget to add entry to the top of the `main.rb` file and add your class to `lib/hero.rb`  `hero_types` method, in order to choose it at the very beginning of the game.

#### Adding own abilities

To add custom abilities or\and change existing, use methods `buffs` and `spells` in `lib/abilities.rb` as examples. Just add 
new spell to hash in likeness of existing and enjoy. 
