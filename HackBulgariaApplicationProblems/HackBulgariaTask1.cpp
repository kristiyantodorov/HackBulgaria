#include <iostream>
#include <string>

using namespace std;

class CoordinateSystem
{
private:
	int x, y;
	bool orientation; // true is positive, false is negative

public:
	CoordinateSystem(int initial_x = 0, int initial_y = 0)
	{
		orientation = true;
		x = initial_x;
		y = initial_y;
	}

	int get_x()
	{
		return x;
	}
	int get_y()
	{
		return y;
	}

	bool get_orientaion()
	{
		return orientation;
	}

	void change_orientation()
	{
		orientation = !orientation;
	}

	void move_x(char direction)
	{
		if (direction == '>')
		{
			if (get_orientaion() == true) 
				x += 1;
			else
				x -= 1;
		}
		else
		{
			if (get_orientaion() == true) 
				x -= 1;
			else
				x += 1;
		}
	}

	void move_y(char direction)
	{
		if (direction == '^')
		{
			if (get_orientaion() == true) 
				y -= 1;
			else
				y += 1;
		}
		else
		{
			if (get_orientaion() == true) 
				y += 1;
			else
				y -= 1;
		}
	}
};

int main()
{
	CoordinateSystem point;
	
	cout << "Starting point: " << "(" << point.get_x() << ", " << point.get_y() << ")" << endl;
	string input_string;
	cin >> input_string;
	
	for (int i = 0; i < input_string.length(); ++i)
	{
		switch (input_string[i])
		{
			case '~': point.change_orientation(); break;
			case '^': point.move_y(input_string[i]); break;
			case 'v': point.move_y(input_string[i]); break;
			case '<': point.move_x(input_string[i]); break;
			case '>': point.move_x(input_string[i]); break;
		}
	}
	
	cout << "(" << point.get_x() << ", " << point.get_y() << ")" << endl;

	return 0;
}