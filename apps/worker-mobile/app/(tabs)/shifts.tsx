import { View, Text, StyleSheet } from "react-native";

export default function ShiftsScreen() {
  return (
    <View style={styles.container}>
      <Text style={styles.title}>Available Shifts</Text>

      <View style={styles.card}>
        <Text>Dishwasher</Text>
        <Text>Restaurant A</Text>
        <Text>6PM - 10PM</Text>
        <Text>₱120/hour</Text>
      </View>

    </View>
  );
}

const styles = StyleSheet.create({
  container: {
    flex: 1,
    padding: 20,
  },
  title: {
    fontSize: 24,
    fontWeight: "bold",
    marginBottom: 20,
  },
  card: {
    backgroundColor: "#eee",
    padding: 16,
    borderRadius: 10,
  },
});