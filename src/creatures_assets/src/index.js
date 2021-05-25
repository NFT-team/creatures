import { Actor, HttpAgent } from '@dfinity/agent';
import { idlFactory as creatures_idl, canisterId as creatures_id } from 'dfx-generated/creatures';

const agent = new HttpAgent();
const creatures = Actor.createActor(creatures_idl, { agent, canisterId: creatures_id });

document.getElementById("clickMeBtn").addEventListener("click", async () => {
  const name = document.getElementById("name").value.toString();
  const greeting = await creatures.greet(name);

  document.getElementById("greeting").innerText = greeting;
});
