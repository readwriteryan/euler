<?php
/** Sorts cards in ascending order based on their full card value i.e. 8H or AD, used in usort */
function compare_cards($card_one, $card_two)
{
	$values = ['2' => 2, '3' => 3, '4' => 4, '5' => 5, '6' => 6, '7' => 7, '8' => 8, '9' => 9, 'T' => 10, 'J' => 11, 'Q' => 12, 'K' => 13, 'A' => 14];
	
	return $values[$card_one[0]] == $values[$card_two[0]] ? 0 : $values[$card_one[0]] > $values[$card_two[0]] ? 1 : -1;
}

/** Sorts cards in descending order based on only the card value i.e. 8 or A, used in usort */
function compare_cards_value($value_one, $value_two)
{
	$values = ['2' => 2, '3' => 3, '4' => 4, '5' => 5, '6' => 6, '7' => 7, '8' => 8, '9' => 9, 'T' => 10, 'J' => 11, 'Q' => 12, 'K' => 13, 'A' => 14];
	
	return $values[$value_one] == $values[$value_two] ? 0 : $values[$value_one] < $values[$value_two] ? 1 : -1;
}

/** Ranks a full hand  in the form of [2H, 3H, 4H, 5H, 6H] from 1 to 9 in increasing order of hand value and returns the 'treated' hand to be used if there is a tie */ 
function rank_hand($hand)
{
	$values 	= ['2' => 2, '3' => 3, '4' => 4, '5' => 5, '6' => 6, '7' => 7, '8' => 8, '9' => 9, 'T' => 10, 'J' => 11, 'Q' => 12, 'K' => 13, 'A' => 14];
	$card_count	= [];
	$straight_count = 1;
	$flush_count	= 1;
	$previous	= NULL;
	
	/** Calculate pairs, straights and flush amounts */
	foreach($hand as $cards)
	{
		if($previous && $values[$previous[0]] == $values[$cards[0]] - 1) $straight_count++;
		if($previous && $previous[1] == $cards[1]) $flush_count++;
		
		$card_count[$cards[0]] = isset($card_count[$cards[0]]) ? $card_count[$cards[0]] + 1 : 1;
		
		$previous = $cards;
	}
	
	/** Sort pair amounts in descending order preserving key -> value pairs (card -> count) */
	asort($card_count, SORT_NUMERIC);
	$card_count = array_reverse($card_count, true);
	
	/** Get highest pair count and secondary pair count */
	list($primary_count, $secondary_count) = array_values($card_count);
	
	/** If the highest count we have is 1 then there were no pairs only a straight, flush or high card situation. Since hands were sorted asc to begin with, for treated hand we only need to reverse the natural order */
	$treated_hand = [];	
	if($primary_count == 1) $treated_hand = array_reverse($card_count, true);
	else 
	{
		/** Otherwise, we must set up the 'treated' hand by first considering the significant cards (pairs) in order followed by the remaining cards in order */
		$significant = $insignificant = [];
		
		foreach($card_count as $card => $count)
			if($count > 1) $significant[] = $card; else $insignificant[] = $card;
		
		usort($significant, 'compare_cards_value');
		usort($insignificant, 'compare_cards_value');
	
		foreach($significant as $card) $treated_hand[$card] = 1;
		foreach($insignificant as $card) $treated_hand[$card] = 1;
	}
	
	/** Simple ranking algorithm which uses the values calculated earlier to return a hand 'rank' along with the treated hand which is used if tie breaking is necessary*/
	if($straight_count == 5 && $flush_count == 5)		return [9, $treated_hand];
	else if($primary_count == 4)				return [8, $treated_hand];
	else if($primary_count == 3 && $secondary_count == 2)	return [7, $treated_hand];
	else if($flush_count == 5)				return [6, $treated_hand];
	else if($straight_count == 5)				return [5, $treated_hand];
	else if($primary_count == 3)				return [4, $treated_hand];
	else if($primary_count == 2 && $secondary_count == 2) 	return [3, $treated_hand];
	else if($primary_count == 2)				return [2, $treated_hand];
	else							return [1, $treated_hand];
}

/** This function is passed the 'treated' hands returned from rank_hand() if a tie break is necessary. To break a tie, it simply needs to step through both hands in order and find the first instance the hands differ at which point the higher card has the better hand. */
function break_tie($hand_one, $hand_two)
{
	$values = ['2' => 2, '3' => 3, '4' => 4, '5' => 5, '6' => 6, '7' => 7, '8' => 8, '9' => 9, 'T' => 10, 'J' => 11, 'Q' => 12, 'K' => 13, 'A' => 14];
	
	for($i = 0; $i < count($hand_one); $i++)
	{
		if($values[$hand_one[$i]] == $values[$hand_two[$i]]) continue;
		else return $values[$hand_one[$i]] > $values[$hand_two[$i]] ? 1 : -1; 
	}
	
	return 0;
}

/** Read the hands from text file and split into two hands and sort them both in ascending card value order, get score for each from rank_hand() and break tie by passing the 'treated' hands from rank_hand() to break_tie() */
$start = microtime(true);
$hands = file('hands.txt');
$count = 0;
foreach($hands as $hand)
{
	$full		= explode(' ', $hand);
	$hand_one	= array_slice($full, 0, 5);
	$hand_two	= array_slice($full, 5, 5);
	
	usort($hand_one, 'compare_cards');
	usort($hand_two, 'compare_cards');
	
	list($score_one, $treated_hand_one) = rank_hand($hand_one);
	list($score_two, $treated_hand_two) = rank_hand($hand_two);
	
	if($score_one == $score_two)
	{
		if(break_tie(array_keys($treated_hand_one), array_keys($treated_hand_two)) > 0) $count++;
	}
	else if($score_one > $score_two) $count++;
}
$end	= microtime(true);
$diff	= $end - $start;

echo "Player One won $count hands which took $diff seconds to process";
?>