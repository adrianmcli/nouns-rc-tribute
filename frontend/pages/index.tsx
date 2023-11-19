import { ConnectButton } from "@rainbow-me/rainbowkit";
import type { NextPage } from "next";
import Head from "next/head";
import styles from "../styles/Home.module.css";
import { getContract } from "@wagmi/core";
import { abi } from "../../out/NounsDAOTributeLedger.sol/NounsDAOTributeLedger.json";

const Home: NextPage = () => {
  // Contract deployed at https://sepolia.scrollscan.com/address/0x1b72e83497c653650f51533afea8923bc7189f66
  const contract = getContract({
    address: "0x1b72e83497c653650f51533afea8923bc7189f66",
    abi: abi,
  });
  return (
    <div className={styles.container}>
      <Head>
        <title>RainbowKit App</title>
        <meta
          content="Generated by @rainbow-me/create-rainbowkit"
          name="description"
        />
        <link href="/favicon.ico" rel="icon" />
        <link rel="preconnect" href="https://fonts.googleapis.com" />
        <link
          rel="preconnect"
          href="https://fonts.gstatic.com"
          crossOrigin="anonymous"
        />
        <link
          href="https://fonts.googleapis.com/css2?family=Londrina+Solid:wght@300;400&display=swap"
          rel="stylesheet"
        />
      </Head>

      <main className={styles.main}>
        <ConnectButton />

        <h1 className={styles.title}>Nouns Running Club Tribute Page</h1>

        <p className={styles.description}>
          1. Choose the POAP corresponding with your Nouns Running Club event.
        </p>
        <p className={styles.description}>
          2. Write a message to show your support!
        </p>
        <p className={styles.description}>
          3. Click submit to post your tribute onto the blockchain!
        </p>

        <div>
          <button>Submit!</button>
        </div>
      </main>

      <footer className={styles.footer}>
        <a href="https://rainbow.me" rel="noopener noreferrer" target="_blank">
          Made with ❤️ by your frens at 🌈
        </a>
      </footer>
    </div>
  );
};

export default Home;
