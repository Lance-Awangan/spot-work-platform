import { View, Text, StyleSheet, Pressable } from "react-native";
import { router } from "expo-router";

export default function HomeScreen() {
  return (
    <View style={styles.container}>
      <Text style={styles.title}>Worker App</Text>
      <Text style={styles.subtitle}>Find nearby shifts</Text>

      <Pressable
        style={styles.button}
        onPress={() => router.push("/shifts")}
      >
        <Text style={styles.buttonText}>View Available Shifts</Text>
      </Pressable>
    </View>
  );
}

const styles = StyleSheet.create({
  container: {
    flex: 1,
    justifyContent: "center",
    alignItems: "center",
  },
  title: {
    fontSize: 28,
    fontWeight: "bold",
  },
  subtitle: {
    fontSize: 16,
    marginBottom: 20,
  },
  button: {
    backgroundColor: "#007AFF",
    padding: 12,
    borderRadius: 8,
  },
  buttonText: {
    color: "white",
    fontWeight: "bold",
  },
});