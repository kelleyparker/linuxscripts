echo -n "What would you like to eat from the menu today?"
read menuChoice

case "$menuChoice" in
        1) echo "Tofu, 4.99";;
        2) echo "Chicken, 6.99";;
        3) echo "Taco, 8.99";;
        *) echo "That's not a menu item, try again.";;
esac
