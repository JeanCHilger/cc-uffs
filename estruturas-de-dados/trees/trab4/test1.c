#include <stdio.h>
#include <stdlib.h>
#include "BinarySearchTree.h"

void insertRandomNumbers(Node **root, long int n, long int max) {
   /*
    * Generate n random numbers within the range [0, max[.
    * */

    long int i;
    for (i = 0; i < n; i++) {
        long int val = rand() % max;
        printf("%ld\r\r\r\r\r\r\r\r", val);
        insert(root, val);
    }
    printf("\r\r\r\r\r\r\r\r");
}

int main() {

    Node* root = NULL;
    int opt;
    long int val;

    showMenu();
    while (1) {
        printf("\n>>> ");
        scanf(" %d", &opt);

        if (opt == 1) {
            if (!empty(root)) {
                free(root);
                root = NULL;
            }

            long int n, max;
            printf("Number of numbers: ");
            scanf(" %ld", &n);
            printf("Max value (the max is not included): ");
            scanf(" %ld", &max);
            
            insertRandomNumbers(&root, n, max);

        } else if (opt == 2) {
            printf("Value to search: ");
            scanf(" %ld", &val);
            
            Node *elem = search(root, val);
            if (elem == NULL) {
                printf ("%ld not found\n", val);
            
            } else {
                printf("%ld found\n", val);
            }

        } else if (opt == 3) {
            long int n;
            printf("Value to erase: ");
            scanf(" %ld", &n);

            erase(&root, NULL, n);
        
        } else if (opt == 4) {
            printf(" 1 - Pre-Order\n 2 - In-Order\n 3 - Post-Order\n 4 - BFS\n: ");
            int n;
            
            scanf(" %d", &n);
            if (n == 1) {
                printPreOrder(root);
            
            } else if (n == 2) {
                printInOrder(root);
            
            } else if (n == 3) {
                printPostOrder(root);
            
            } else if (n == 4) {
                printBFS(root);
            }
        
        } else if (opt == 5) {
            clear(root);
            root = NULL;
        
        } else if (opt == 6) {
            long int h = calcTreeHeight(root);
            printf("%ld, with root,\n", h);
            printf("%ld, without.\n", h - 1);

        } else if (opt == 7) {
            long int n = countNumberOfNodes(root);
            printf("Number of nodes: %ld\n", n);

        } else if (opt == 8) {
            long int n;
            printf("Get predecessor of: ");
            scanf(" %ld", &n);
            Node *p = getPredecessor(root, NULL, n);
            if (!empty(p)) {
                printf("Predecessor of %ld is %ld\n", n, p -> value);
            
            } else {
                printf("Value has no predecessor.\n");
            }

        } else if (opt == 9) {
            long int n;
            printf("Get sucessor of: ");
            scanf(" %ld", &n);
            Node *s = getSucessor(root, NULL, n);
            if (!empty(s)) {
                printf("Sucessor of %ld is %ld\n", n, s -> value);

            } else {
                printf("The value has no sucessor\n");
            }

        } else if (opt == 10) {
            system("clear");
            showMenu();
        
        } else if (opt == 0) {
            printf("Goodbye.\n");
            if (!empty(root)) {
                free(root);
                root = NULL;                                               
            }

            break;

        } else {
            printf("What did you said?\n");
        }

    }

    return 0;
}
