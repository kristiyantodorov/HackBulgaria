#include <iostream>
#include <string>
#include <map>

using namespace std;

map <string, int> Directions;

void initialize_directions()
{
	Directions["down-left"] = 1;
	Directions["down"] = 2;
	Directions["down-right"] = 3;
	Directions["left"] = 4;
	Directions["right"] = 6;
	Directions["up-left"] = 7;
	Directions["up"] = 8;
	Directions["up-right"] = 9;
}

void initialize(string* table, int& rows, int& columns, string& word)
{
	cout << "Enter the number of rows: ";
	cin >> rows;

	cout << "Enter the number of columns: ";
	cin >> columns;

	cout << "Enter the word you want to search: ";
	cin >> word;

	for (int i = 0; i < rows; ++i)
	 {
	 	do 
	 	{
	 		cout << "Enter row " << i << ": ";
	 		cin >> table[i];
	 		if (table[i].length() != columns)
	 		{
	 			cout << "Wrong length! Try again. \n";
	 		}
	 	}
	 	while (table[i].length() != columns);
	 }
}

int check (string wanted_word, string* table, int current_row, int current_column, int rows, int columns, string dir)
{
	if ((current_row < 0 || current_row >= rows) || (current_column < 0 || current_column >= columns)) return 0;
	if (wanted_word[0] != table[current_row][current_column]) return 0;
	if (wanted_word.length() == 1) return 1;

	switch (Directions[dir])
	{
		//Continues to search for the next letter in the same direction
		//The numbers are the values of the map
		//Each number is chosen based on the keyboard numpad
		case 8: return check (wanted_word.erase(0, 1), table, current_row + 1, current_column, rows, columns, dir);
		case 2: return check (wanted_word.erase(0, 1), table, current_row - 1, current_column, rows, columns, dir);
		case 4: return check (wanted_word.erase(0, 1), table, current_row, current_column - 1, rows, columns, dir);
		case 6: return check (wanted_word.erase(0, 1), table, current_row, current_column + 1, rows, columns, dir);
		case 1: return check (wanted_word.erase(0, 1), table, current_row - 1, current_column - 1, rows, columns, dir);
		case 3: return check (wanted_word.erase(0, 1), table, current_row - 1, current_column + 1, rows, columns, dir);
		case 7: return check (wanted_word.erase(0, 1), table, current_row + 1, current_column - 1, rows, columns, dir);
		case 9: return check (wanted_word.erase(0, 1), table, current_row + 1, current_column + 1, rows, columns, dir);
	}
}


int find_word(string wanted_word, string* table, int rows, int columns)
{
	int counter = 0;
	for (int i = 0; i < rows; ++i)
	{
		for (int j = 0; j < columns; ++j)
		{
			// Look for the word in every of the eight directions and add 1 to the counter for every found word
			counter += check (wanted_word, table, i, j, rows, columns, "up") +
					   check (wanted_word, table, i, j, rows, columns, "down") +
					   check (wanted_word, table, i, j, rows, columns, "left") +
					   check (wanted_word, table, i, j, rows, columns, "right") +
					   check (wanted_word, table, i, j, rows, columns, "up-right") +
					   check (wanted_word, table, i, j, rows, columns, "up-left") +
					   check (wanted_word, table, i, j, rows, columns, "down-left") +
					   check (wanted_word, table, i, j, rows, columns, "down-right");
		}
	}
	return counter;
}

int main()
{
	string* table;
	int rows;
	int columns;
	string word;

	table = new string[rows];  

	initialize(table, rows, columns, word);
	initialize_directions();

	cout << "The word '" << word << "' is found " << find_word(word, table, rows, columns) << " times." << endl;

	return 0;
}