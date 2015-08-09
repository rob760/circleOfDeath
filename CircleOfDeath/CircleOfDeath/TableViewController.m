//
//  TableViewController.m
//  CircleOfDeath
//
//  Created by Robert Pena on 7/31/15.
//  Copyright (c) 2015 Robert Pena. All rights reserved.
//

#import "TableViewController.h"
#import "Card.h"

@interface TableViewController ()
@property (weak, nonatomic) IBOutlet UITextField *cardLabel;
@property int cardCount;
@property (weak, nonatomic) IBOutlet UILabel *ruleLabel;
@end

@implementation TableViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self initDeck];
    [self shuffleDeck];
    [self shuffleDeck];
    [self logDeck];
    [self cardTapped:nil];
    
   
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)cardTapped:(id)sender {
    
    Card *c = self.deck[self.cardCount];

      self.cardLabel.text= [c.suit stringByAppendingString:[c.value stringValue]];
    self.ruleLabel.text= c.rule;
    self.cardCount++;
}


-(void) initDeck
{
    self.deck = [[NSMutableArray alloc]init];

    for (int i=0;i<13; i++)
    {
        Card *newCard = [Card new];
        newCard.suit = @"Club";
        newCard.value = @(i);
        [self.deck addObject:newCard];
    }
    for (int i = 0; i<13 ; i++)
    {
        Card *newCard = [Card new];
        newCard.suit = @"Spade";
        newCard.value = @(i);
        [self.deck addObject:newCard];
    }
    for (int i = 0; i<13 ; i++)
    {
        Card *newCard = [Card new];
        newCard.suit = @"Heart";
        newCard.value = @(i);
        [self.deck addObject:newCard];
    }
    for (int i = 0; i<13 ; i++)
    {
        Card *newCard = [Card new];
        newCard.suit = @"Diamond";
        newCard.value = @(i);
        [self.deck addObject:newCard];
    }
    //[self logDeck];
    
    for (Card * card in self.deck) {
        if ([card.value  isEqual: @(0)])
        {
            card.rule = @"Water fall, BITCHES!";
        } else if ([card.value  isEqual: @(1)])
        {
            card.rule = @"2 You, choose someone to drink!";
        }
        else if ([card.value  isEqual: @(2)])
        {
            card.rule = @"3. Me. Drink by yo self loser!";
        }
        else if ([card.value  isEqual: @(3)])
        {
            card.rule = @"4 Whoores, everyone with a vag drink up!";
        }
        else if ([card.value  isEqual: @(4)])
        {
            card.rule = @"5 Drive(?)....Play that stupid driving game";
        }
        else if ([card.value  isEqual: @(5)])
        {
            card.rule = @"6 Dicks, anyone with a penis drink!";
        }
        else if ([card.value  isEqual: @(6)])
        {
            card.rule = @"7 Hevean";
        }
        else if ([card.value  isEqual: @(7)])
        {
            card.rule = @"8 M8, Pick a mate to drink with!";
        }
        else if ([card.value  isEqual: @(8)])
        {
            card.rule = @"9 Rhyme!";
        }
        else if ([card.value  isEqual: @(9)])
        {
            card.rule = @"10 Categories(?)";
        }
        else if ([card.value  isEqual: @(10)])
        {
            card.rule = @"Jack. neva have I eva!";
        }
        else if ([card.value  isEqual: @(11)])
        {
            card.rule = @"Queen. ¿¡Questions!?";
        }
        else if ([card.value  isEqual: @(12)])
        {
            card.rule = @"King, Make up a rule!";
        }
    }
   

}


-(void) shuffleDeck
{
    int randCard;
    Card *tmp;
        for (int i = 0; i < 52; i++)
        {
            randCard = arc4random_uniform(52);
            tmp = self.deck[i];
            self.deck[i] = self.deck[randCard];
            self.deck[randCard] = tmp;
        }

    
}


-(void) logDeck
{
    for (Card *card in self.deck)
    {
        NSLog(@"%@ %@ ", [card value],[card suit]);
    }
    
    
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
