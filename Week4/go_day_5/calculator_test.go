// calculator test

package main

import "testing"

func TestAdd(t *testing.T) {
	result := Add(2, 3)
	if result != 5 {
		t.Errorf("Expected 5, got %d", result)
	}
}

func TestDivideIntValid(t *testing.T) {
	result, err := DivideInt(10, 2)
	if err != nil || result != 5 {
		t.Error("DivideInt failed")
	}
}

func TestDivideIntByZero(t *testing.T) {
	_, err := DivideInt(10, 0)
	if err == nil {
		t.Error("Expected divide-by-zero error")
	}
}
